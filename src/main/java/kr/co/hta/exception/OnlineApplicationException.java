package kr.co.hta.exception;

public class OnlineApplicationException extends RuntimeException {

	// 객체를 네트워크에서 주고 받을 때 객체를 식별하기 위한 값. 
	private static final long serialVersionUID = 7299015771786044145L;

	public OnlineApplicationException(String message) {
		super(message);
	}
	
	public OnlineApplicationException(String message, Throwable cause) {
		super(message, cause);
	}
}
