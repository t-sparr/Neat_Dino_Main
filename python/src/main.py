from tcp_server import start_server, send_to_client
import json
import time

def received_data(data):
    # fitness = data.get("fitness", 0.0)  # Fixed typo
    
    # return json.dumps({"ack": True, "echo_fitness": fitness})
    msg_type = data.get("type")
    if(msg_type == "create_population"):
        return json.dumps({"poo" : "ff" })

if __name__ == "__main__":
    start_server(received_data)

    print("[*] Server running. Press Ctrl+C to stop.")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[x] Interrupted by user.")
