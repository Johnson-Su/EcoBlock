import requests as req
import os, json

SAVED_PORTS = {}

def set_url():
    return "http://localhost:" + HTTP_PORT + "/"

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
    return req.get(url = URL + "balance").json()

def q_address(address = ""):
    if address == "":
        return req.get(url = URL + "address").json()
    else:
        return req.get(url = URL + "address/" + address).json()

def add_peer(port):

    try:
        data = req.post(url = URL + "addPeer", json = {"peer" : "ws://localhost:" + port}).json()
    except Exception:
        print(Exception)
        data = req.post(url = URL + "addPeer", json = {"peer" : "ws://localhost:" + port})
    return data

def get_peers():
    return req.get(url = URL + "peers").json()

def update_db():
    return req.get(url = URL + "updateFirebase").json()

if __name__ == "__main__":
    # Grab HTTP env 
    env_var = os.getenv('HTTP_PORT')
    HTTP_PORT = "3000" if env_var == None or env_var == "" else env_var
    # Grab P2P env 
    env_var = os.getenv('P2P_PORT')
    P2P_PORT = "6000" if env_var == None or env_var == "" else env_var
    # Set Local URL
    URL = set_url()
    # Just to exit when I want to
    cont = True

    while (cont):
        print("---------------------------------------------------")
        print("HTTP_PORT = " + HTTP_PORT)
        print("P2P_PORT = " + P2P_PORT)
        print("URL = " + URL)
        print(f"Saved Ports: {SAVED_PORTS}")
        print("---------------------------------------------------")
        menu = """1 - Get Blockchain\n2 - Mint Block\n3 - Send TX\n4 - Get TX Pool\n5 - Mint TX\n6 - Get Balance\n7 - Query Address\n8 - Add Peer\n9 - Get Peers\n0 - update DB\nc - Change Ports\nsave - Save Current Ports\nload - Load A Saved Port\nbulk - Bulk Add ports to saved\nx - Exit\n"""
        choice = input(menu)
        try:
            if choice == "1":
                print(json.dumps(get_blockchain(), indent=1))
            elif choice == "2":
                print(json.dumps(mint_block(), indent=1))
            elif choice == "3":
                address = input("Address to Send (Public Key): ")
                amount = input("Amount to Send: ")
                print(json.dumps(send_transaction(address, int(amount)), indent=1))
            elif choice == "4":
                print(json.dumps(get_tx_pool(), indent=1))
            elif choice == "5":
                address = input("Address to Mint (Public Key): ")
                amount = input("Amount to Mint: ")
                print(json.dumps(mint_tx(address, int(amount)), indent=1))
            elif choice == "6":
                print(get_balance())
            elif choice == "7":
                address = input("Address to Query (Public Key): (Hit enter for current Port Address) ")
                print(q_address(address))
            elif choice == "8":
                port = input("P2P Port of Peer: ")
                result = add_peer(port)
                json.dumps(result, indent=1)
            elif choice == "9":
                print(json.dumps(get_peers(), indent=1))
            elif choice == "0":
                print(update_db())
            elif choice.lower() == "c":
                port = input("Port of HTTP: ")
                HTTP_PORT = port
                port = input("Port of P2P: ")
                P2P_PORT = port
                URL = set_url()
            elif choice.lower() == "save":
                SAVED_PORTS[len(SAVED_PORTS) + 1] = [HTTP_PORT, P2P_PORT]
            elif choice.lower() == "load":
                print(SAVED_PORTS)
                id = input("Enter save ID: ")
                id = int(id)
                if id in SAVED_PORTS:
                    HTTP_PORT = SAVED_PORTS[id][0]
                    P2P_PORT = SAVED_PORTS[id][1]
                    URL = set_url()
                    print(f"Loaded HTTP Port {HTTP_PORT} and P2P Port {P2P_PORT}")
                else:
                    print("Invalid ID")
            elif choice.lower() == "bulk":
                num = input("How many nodes do you want to add? ")
                for i in range(int(num)):
                    posth = input("Enter HTTP Port: ")
                    postp = input("Enter P2P Port: ")
                    SAVED_PORTS[len(SAVED_PORTS) + 1] = [posth, postp]
            elif choice.lower() == "x":
                cont = False
            else:
                print("Invalid Command")
        except Exception as e:
            print(e)



