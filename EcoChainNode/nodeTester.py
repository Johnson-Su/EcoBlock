import requests as req
import os

HTTP_PORT = 0
P2P_PORT = 0
URL = ""

def get_blockchain():
    return req.get(url = URL + "blocks").json()

def mint_block():
    return req.post(url = URL + "mintBlock").json()

def send_transaction(address, amount):
    return req.get(url = URL + "sendTransaction", header = {"Content-type" : "application/json"}, params = {"address" : address, "amount" : amount}).json()

def get_tx_pool():
    return req.get(url = URL + "transactionPool").json()

def mint_tx(address, amount):
    return req.get(url = URL + "mintTransaction", header = {"Content-type" : "application/json"}, params = {"address" : address, "amount" : amount}).json()

def get_balance():
    return req.post(url = URL + "balance").json()

def q_address(address):
    return req.post(url = URL + "address/" + address).json()

def add_peer(port):
    return req.get(url = URL + "addPeer", header = {"Content-type" : "application/json"}, params = {"peer" : "ws://localhost:" + port}).json()

def get_peers():
    return req.post(url = URL + "peers").json()

def update_db():
    return req.post(url = URL + "updateFirebase").json()

if __name__ == "__main__":
    # Grab HTTP env 
    env_var = os.getenv('HTTP_PORT')
    HTTP_PORT = 3000 if env_var == None or env_var == "" else int(env_var)
    # Grab P2P env 
    env_var = os.getenv('P2P_PORT')
    P2P_PORT = 6000 if env_var == None or env_var == "" else int(env_var)
    # Set Local URL
    URL = "http://localhost:" + HTTP_PORT + "/"
    # Just to exit when I want to
    cont = True

    while (cont):
        menu = """
        1 - Get Blockchain\n
        2 - Mint Block\n
        3 - Send TX\n
        4 - Get TX Pool\n
        5 - Mint TX\n
        6 - Get Balance\n
        7 - Query Address\n
        8 - Add Peer\n
        9 - Get Peers\n
        0 - update DB\n
        x - Exit\n
        """
        choice = input(menu)

        if choice == "1":
            print(get_blockchain())
        elif choice == "2":
            print(mint_block())
        elif choice == "3":
            address = input("Address to Send (Public Key): ")
            amount = input("Amount to Send: ")
            print(send_transaction(address, amount))
        elif choice == "4":
            print(get_tx_pool())
        elif choice == "5":
            address = input("Address to Mint (Public Key): ")
            amount = input("Amount to Mint: ")
            print(mint_tx(address, amount))


