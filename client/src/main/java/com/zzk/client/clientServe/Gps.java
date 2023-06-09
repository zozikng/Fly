package com.zzk.client.clientServe;

public class Gps {

	private double wgLat; // 纬度
	private double wgLon; // 经度

	public Gps(){

	}

	public Gps(double wgLat, double wgLon) {
		setWgLat(wgLat);
		setWgLon(wgLon);
	}

	public double getWgLat() {
		return wgLat;
	}

	public void setWgLat(double wgLat) {
		this.wgLat = wgLat;
	}

	public double getWgLon() {
		return wgLon;
	}

	public void setWgLon(double wgLon) {
		this.wgLon = wgLon;
	}

	@Override
	public String toString() {
		return wgLat + "," + wgLon;
	}

}

