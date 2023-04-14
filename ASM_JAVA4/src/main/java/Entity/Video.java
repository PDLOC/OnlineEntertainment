package Entity;

import java.io.File;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@NamedNativeQueries({
		@NamedNativeQuery(name = "Report.random10", query = "SELECT TOP 10 * FROM Videos ORDER BY newid()", resultClass = Video.class) })

@NamedQueries({
		@NamedQuery(name = "Video.findByKeyword", query = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.title LIKE :keyword"),
		@NamedQuery(name = "Video.findByUser", query = "SELECT o.video FROM Favorite o WHERE o.user.id = :id"),
		@NamedQuery(name = "Video.findInRange", query = "SELECT DISTINCT o.video FROM Favorite o  WHERE o.likeDate BETWEEN :min AND :max"),
		/* JPA ko co hàm month */
		@NamedQuery(name = "Video.findInMonths",
//				query = "SELECT DISTINCT o.likeDate from Favorite o "
				query = "SELECT DISTINCT o.video FROM Favorite o WHERE month(o.likeDate) IN (:months)") })
@Entity
@Table(name = "Videos")
public class Video {
	@Id
	@Column(name = "videoId")
	private String id;
	@Column(name = "title")
	private String title;
	@Column(name = "poster")
	private String poster;
	@Column(name = "mota")
	private String mota;
	@Column(name = "luotxem")
	private Integer views;
	@Column(name = "active")
	private Boolean active;

	@OneToMany(mappedBy = "video")
	private List<Favorite> favorites;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Video(String id, String title, String poster, String mota, Integer views, Boolean active) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.mota = mota;
		this.views = views;
		this.active = active;
	}

	public Video() {
		super();
	}



	
}
