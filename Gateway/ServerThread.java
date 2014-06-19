package SocialPrinter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ServerThread extends Thread {
	private Socket socket;
	private BufferedReader br = null;
	private PrintWriter pw = null;
	private String clientIP;

	public ServerThread(Socket socket){
		this.socket = socket;
		this.clientIP = this.socket.getInetAddress().toString();
	}

	public void run(){
		try{
			service();
		}catch(IOException e){
			System.out.println(clientIP + " Connection End..");
		}finally{
			try{
				closeAll();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}

	private void service() throws IOException {

		br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		pw = new PrintWriter(socket.getOutputStream(), true);
		String msg = null;

		while(true){
			msg = br.readLine();
		
			if(msg == null){
				System.out.println("No Message..");
				break;
			}

			BufferedWriter writer = new BufferedWriter(new FileWriter("msg.txt"));
			writer.write(msg);
			writer.close();

			System.out.println(clientIP + ": " + msg);
		}

	}

	public void closeAll() throws IOException {
		if(pw != null)
			pw.close();

		if(br != null)
			br.close();

		if(socket != null)
			socket.close();
	}
}