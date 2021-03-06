import * as  bodyParser from 'body-parser';
import * as express from 'express';
import * as _ from 'lodash';
import * as fs from 'fs';
import {
    Block, generateNextBlock, generatenextBlockWithTransaction, generateRawNextBlock, getAccountBalance,
    getBlockchain, getMyUnspentTransactionOutputs, getUnspentTxOuts, sendTransaction
} from './blockchain';
import {connectToPeers, getSockets, initP2PServer, tryInitialConnections} from './p2p';
import {UnspentTxOut, TxIn} from './transaction';
import {getTransactionPool} from './transactionPool';
import {getPublicFromWallet, initWallet} from './wallet';
import {FirebaseService} from './firebaseService';
import { exception } from 'node:console';
import { find } from 'lodash';

const httpPort: number = parseInt(process.env.HTTP_PORT) || 3000;
const p2pPort: number = parseInt(process.env.P2P_PORT) || 6000;

const fName: string = process.env.WALLETFNAME || "";
const lName: string = process.env.WALLETLNAME || "";
const ecoBoost = process.env.ECOBOOST == "true";

const fbService = new FirebaseService();


function getTxHistory() {

    let txHistory = [];
    getBlockchain().forEach(block => {

        const time = block.timestamp;

        block.data.forEach(tx => {

            tx.txOuts.forEach(txOut => {
                if (txOut.address === getPublicFromWallet() && txOut.sender === getPublicFromWallet()) {
                    txHistory.push({
                        "type": "self",
                        "time": time,
                        "amount": txOut.amount,
                    });
                }
                else if (txOut.sender === getPublicFromWallet()) {
                    txHistory.push({
                        "type": "outbound",
                        "time": time,
                        "amount": txOut.amount,
                        "reciever": txOut.address
                    });
                }
                else if (txOut.address === getPublicFromWallet()) {
                    txHistory.push({
                        "type": "inbound",
                        "time": time,
                        "amount": txOut.amount,
                        "sender": txOut.sender
                    });
                }
            });
            
        });
        
    });

    return txHistory;
}

function updateFirebase() {
    const walletId = getPublicFromWallet();

        const tx = getTxHistory()
        const data = {
            id: walletId,
            first: fName,
            last: lName,
            balance: getAccountBalance() || 0,
            txHistory: tx || [],
            ecoBoost:  ecoBoost
        };

        fbService.addData(walletId, data);
        console.log("DB updated for this node");
}

function tryConnections() {
    console.log("Trying to find some peers...")
    try {
        const data = fs.readFileSync('node/peerData/defaultPeers', 'utf8');
        const portList = data.split(/\r?\n/);
        portList.pop();

        tryInitialConnections(portList);
    }
    catch (e){
        console.log(e);
    }
};


const initHttpServer = (myHttpPort: number) => {
    const app = express();
    app.use(bodyParser.json());

    app.use((err, req, res, next) => {
        if (err) {
            res.status(400).send(err.message);
        }
    });

    app.get('/blocks', (req, res) => {
        res.send(getBlockchain());
    });

    app.get('/block/:hash', (req, res) => {
        const block = _.find(getBlockchain(), {'hash' : req.params.hash});
        res.send(block);
    });

    app.get('/transaction/:id', (req, res) => {
        const tx = _(getBlockchain())
            .map((blocks) => blocks.data)
            .flatten()
            .find({'id': req.params.id});
        res.send(tx);
    });

    app.get('/address/:address', (req, res) => {
        const unspentTxOuts: UnspentTxOut[] =
            _.filter(getUnspentTxOuts(), (uTxO) => uTxO.address === req.params.address);
        res.send({'unspentTxOuts': unspentTxOuts});
    });

    app.get('/unspentTransactionOutputs', (req, res) => {
        res.send(getUnspentTxOuts());
    });

    app.get('/myUnspentTransactionOutputs', (req, res) => {
        res.send(getMyUnspentTransactionOutputs());
    });

    app.post('/mintRawBlock', (req, res) => {
        if (req.body.data == null) {
            res.send('data parameter is missing');
            return;
        }
        const newBlock: Block = generateRawNextBlock(req.body.data);
        if (newBlock === null) {
            res.status(400).send('could not generate block');
        } else {
            res.send(newBlock);
        }
    });

    app.post('/mintBlock', (req, res) => {
        const newBlock: Block = generateNextBlock();
        updateFirebase()
        if (newBlock === null) {
            res.status(400).send('could not generate block');
        } else {
            res.send(newBlock);
        }
    });

    app.get('/balance', (req, res) => {
        const balance: number = getAccountBalance();
        res.send({'balance': balance});
    });

    app.get('/address', (req, res) => {
        const address: string = getPublicFromWallet();
        res.send({'address': address});
    });

    app.get('/updateFirebase', (req, res) => {

        updateFirebase()
        res.send({"msg": "DB updated"});
    });

    app.post('/mintTransaction', (req, res) => {
        const address = req.body.address;
        const amount = req.body.amount;
        try {
            const resp = generatenextBlockWithTransaction(address, amount);
            res.send(resp);
        } catch (e) {
            console.log(e.message);
            res.status(400).send(e.message);
        }
    });

    app.post('/sendTransaction', (req, res) => {
        try {
            const address = req.body.address;
            const amount = req.body.amount;

            if (address === undefined || amount === undefined) {
                throw Error('invalid address or amount');
            }
            const resp = sendTransaction(address, amount);
            updateFirebase()
            res.send(resp);
        } catch (e) {
            console.log(e.message);
            res.status(400).send(e.message);
        }
    });

    app.get('/transactionPool', (req, res) => {
        res.send(getTransactionPool());
    });

    app.get('/peers', (req, res) => {
        res.send(getSockets().map((s: any) => s._socket.remoteAddress + ':' + s._socket.remotePort));
    });
    app.post('/addPeer', (req, res) => {
        connectToPeers(req.body.peer);
        res.send({"msg": "success"});
    });

    app.post('/stop', (req, res) => {
        res.send({'msg' : 'stopping server'});
        process.exit();
    });

    app.listen(myHttpPort, () => {
        console.log('HTTP listening on port: ' + myHttpPort);
    });
};

initWallet();
console.log("Your address is: " + getPublicFromWallet());
initHttpServer(httpPort);
initP2PServer(p2pPort);
tryConnections();
