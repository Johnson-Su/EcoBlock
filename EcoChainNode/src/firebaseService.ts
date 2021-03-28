  
import firebase from "firebase/app";
import "firebase/firestore";

export class FirebaseService
{
    private readonly _db: firebase.firestore.Firestore;
    
    public constructor()
    {
        firebase.initializeApp({
            apiKey: "AIzaSyCT-S728H9jrN2iSZOQygH2aoDdeI_ekeQ",
            authDomain: "ecoblock-78ece.firebaseapp.com",
            projectId: "ecoblock-78ece",
            storageBucket: "ecoblock-78ece.appspot.com",
            messagingSenderId: "979911597467",
            appId: "1:979911597467:web:581a3a0bd1bf760709553e",
            measurementId: "G-B63T852Y3B"
        });
        
        this._db = firebase.firestore();
        
    }
    
    public async addData(publicKey: string, data: object): Promise<void>
    {
        await this._db.collection("Wallets").doc(publicKey).set(data);
    }
}