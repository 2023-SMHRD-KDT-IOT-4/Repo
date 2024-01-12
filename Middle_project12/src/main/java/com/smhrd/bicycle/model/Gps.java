package com.smhrd.bicycle.model;

public class Gps {
	
	// 위치 순번 
    private Double loc_seq;

    // 위도 
    private Double lat;

    // 경도 
    private Double lng;

    // 속도 
    private Double speed;

    // 기록날짜 
    private String created_at;

    // 유저 아이디 
    private String user_id;

    public Double getLocSeq() {
        return loc_seq;
    }

    public void setLocSeq(Double locSeq) {
        this.loc_seq = loc_seq;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getSpeed() {
        return speed;
    }

    public void setSpeed(Double speed) {
        this.speed = speed;
    }

    public String getCreatedAt() {
        return created_at;
    }

    public void setCreatedAt(String createdAt) {
        this.created_at = created_at;
    }

    public String getUserId() {
        return user_id;
    }

    public void setUserId(String userId) {
        this.user_id = user_id;
    }

	public Gps(Double lat, Double lng, Double speed, String user_id) {
		super();
		this.lat = lat;
		this.lng = lng;
		this.speed = speed;
		this.user_id = user_id;
	}

	public Gps(Double lat, Double lng) {
		super();
		this.lat = lat;
		this.lng = lng;
	}

	public Gps(Double lat, Double lng, String user_id) {
		super();
		this.lat = lat;
		this.lng = lng;
		this.user_id = user_id;
	}

	public Gps() {
		super();
	}
	
	
}
