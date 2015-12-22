package motozio.model;
/**
 * 
 * @author sreddy1
 *
 */
public class HealthItem {
	private String title;
    private String description;
    private boolean available;
    
    public HealthItem(){
    	this("Unknown Item", false);
	}

    public HealthItem(String title, boolean available){
        this.title = title;
        this.available = available;
    }
    
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
}
