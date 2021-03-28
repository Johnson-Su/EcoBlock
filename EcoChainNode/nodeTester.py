import requests as req
import os, json

HTTP_PORT = 0
P2P_PORT = 0
URL = ""

def get_blockchain():
    return req.get(url = URL + "blocks").json()

def mint_block():
    return req.post(url = URL + "mintBlock").json()

def send_transaction(address, amount):
    return req.post(url = URL + "sendTransaction", json = {"address" : address, "amount" : amount}).json()

def get_tx_pool():
    return req.get(url = URL + "transactionPool").json()

def mint_tx(address, amount):
    return req.post(url = URL + "mintTransaction", json = {"address" : address, "amount" : amount}).json()

def get_balance():
    return req.get(url = URL + "balance")

def q_address(address = ""):
    if address == "":
        return req.get(url = URL + "address")
    else:
        return req.get(url = URL + "address/" + address)

def add_peer(port):
    return req.post(url = URL + "addPeer", json = {"peer" : "ws://localhost:" + port})

def get_peers():
    return req.get(url = URL + "peers").json()

def update_db():
    return req.get(url = URL + "updateFirebase")

if __name__ == "__main__":
    # Grab HTTP env 
    env_var = os.getenv('HTTP_PORT')
    HTTP_PORT = "3000" if env_var == None or env_var == "" else env_var
    # Grab P2P env 
    env_var = os.getenv('P2P_PORT')
    P2P_PORT = "6000" if env_var == None or env_var == "" else env_var
    # Set Local URL
    URL = "http://localhost:" + HTTP_PORT + "/"
    # Just to exit when I want to
    cont = True

    while (cont):
        menu = """1 - Get Blockchain\n2 - Mint Block\n3 - Send TX\n4 - Get TX Pool\n5 - Mint TX\n6 - Get Balance\n7 - Query Address\n8 - Add Peer\n9 - Get Peers\n0 - update DB\nx - Exit\n"""
        choice = input(menu)

        if choice == "1":
            print(json.dumps(get_blockchain(), indent=1))
        elif choice == "2":
            print(json.dumps(mint_block(), indent=1))
        elif choice == "3":
            address = input("Address to Send (Public Key): ")
            amount = input("Amount to Send: ")
            print(json.dumps(send_transaction(address, amount), indent=1))
        elif choice == "4":
            print(json.dumps(get_tx_pool(), indent=1))
        elif choice == "5":
            address = input("Address to Mint (Public Key): ")
            amount = input("Amount to Mint: ")
            print(json.dumps(mint_tx(address, amount), indent=1))
        elif choice == "6":
            print(get_balance())
        elif choice == "7":
            address = input("Address to Query (Public Key): (Hit enter for current Port Address)")
            print(q_address(address))
        elif choice == "8":
            port = input("Port of Peer: ")
            print(add_peer(port))
        elif choice == "9":
            print(get_peers())
        elif choice == "0":
            print(update_db())
        elif choice.lower() == "x":
            cont = False
        


