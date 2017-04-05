import java.util.HashMap;
import java.util.Map;

public class DataManager {
    
	private Map<String,Object> data = new HashMap<String,Object>();
	private static final DataManager instance = new DataManager();
	
	private DataManager() {
		Map<String,String> map = new HashMap<String,String>();
		map.put("1", "Company");
		map.put("2", "Organization");
		map.put("3", "Governement");
		data.put("type", map);
		map = new HashMap<String,String>();
		map.put("1", "Software");
		map.put("2", "Hosting");
		map.put("3", "Industrial");
		map.put("4", "Construction");
		map.put("5", "Consulting");
		map.put("6", "Provision of services");
		map.put("7", "Other");
		data.put("business", map);
		map = new HashMap<String,String>();
		map.put("1", "rising");
		map.put("2", "growing");
		map.put("3", "strong");
		map.put("4", "struggling");
		data.put("state", map);
		map = new HashMap<String,String>();
		map.put("1", "Companies");
		map.put("2", "Governments");
		map.put("3", "Communities");
		map.put("4", "all");
		data.put("target", map);
	}
	
	@SuppressWarnings("unchecked")
	public String getValue(String key,String value) {
		Map<String,String> map = (Map<String, String>) data.get(key);
		return map.get(value);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,String> getMap(String key) {
		return (Map<String, String>) data.get(key);
	}
	
	public static DataManager getInstance() {
		return instance;
	}
}
