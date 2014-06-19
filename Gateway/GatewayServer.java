package SocialPrinter;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class GatewayServer {

	public void go() throws IOException {
		ServerSocket sSocket = null;
		Socket socket = null;

		try{
			sSocket = new ServerSocket(5000);
			System.out.println("Server Start..");

			while(true){
				socket = sSocket.accept();
				ServerThread st = new ServerThread(socket);
				st.start();
				System.out.println(socket.getInetAddress()+" Connection..");
			}
		}finally{
			if(socket != null)
				socket.close();
			if(sSocket != null)
				sSocket.close();

			System.out.println("Server Close..");
		}	
	}

	public static void main(String[] args){
		GatewayServer gs = new GatewayServer();

		try{
			gs.go();
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}