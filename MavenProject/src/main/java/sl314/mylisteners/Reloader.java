package sl314.mylisteners;
import sl314.mylisteners.Data;


public class Reloader implements Runnable{
	
	Data d;
	
	
	public Reloader(Data d)
	{
		this.d=d;
	}
	@Override
	public void run()
	{
		synchronized(d)
		{
		d.reload();
		}
	}
	
	}
