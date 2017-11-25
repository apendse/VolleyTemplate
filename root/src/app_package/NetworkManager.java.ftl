package ${packageName};

import android.content.Context;
import java.util.Map;
import java.util.HashMap;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

/**
  A simple Volley based network manager
**/
public class NetworkManager {
	private static final NetworkManager INSTANCE = new NetworkManager;

	HashMap<String, RequestQueue> queues;

	public static NetworkManager getInstance() {
		return INSTANCE;
	}
	public NetworkManager() {
		queues = new HashMap<>();
	}

	public RequestQueue getRequestQueue(String name, Context context) {
		if (!queues.containsKey(name)) {
			RequestQueue que = Volley.newRequestQueue(context);
			queues.put(name, que);	
		}
		return queues.get(name);
	}

}