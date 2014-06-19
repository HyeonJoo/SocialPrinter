import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

/*
	File Name: ServerFile.java
	Author: Jeon Youbin & Park MiJeong

	It receives the requset from Social Printer Web.
	Then, save the message in the shared file. 
*/

public class ServerFile {
    public static void main(String[] args) throws IOException{

	
        // Set server port for receiving request from Social Printer Web	
        int port=3500;           
        ServerSocket server =new ServerSocket(port);

        // Create server socket
        System.out.println("Server is waiting..");
        Socket socket = server.accept();  

        InputStream is = socket.getInputStream();                   
        InputStreamReader isr = new InputStreamReader(is);    	    
        BufferedReader br = new BufferedReader(isr);              

        String line = null;
        OutputStreamWriter osw =new OutputStreamWriter(System.out);
        PrintWriter pw =new PrintWriter(osw);

        while(true){
		
	    // when received the message from Social Printer Web
	    if((line=br.readLine())!=null){
		if(line.equals("quit"))
			break;

            	pw.println(line);
            	pw.flush();

		// Save the message in the shared file
		BufferedWriter writer = new BufferedWriter(new FileWriter("msg.txt"));
		writer.write(line);
		writer.close();
	    }
	}

	// Close .. 
	socket.close();
        br.close();
        pw.close();
        
    }
}
