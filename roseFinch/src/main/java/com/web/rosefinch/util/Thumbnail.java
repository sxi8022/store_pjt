package com.web.rosefinch.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Thumbnail {
	
	private static Logger logger = LoggerFactory.getLogger(Thumbnail.class);
	
	private static URL rootUrl;
	private static String rootPath;

	private Thumbnail(){
		logger.info("썸네일 인스턴스화");
	}
	
	private static class ThumbnailHolder {
		
		private static final Thumbnail instance = new Thumbnail();
		static{
			rootUrl = Thumbnail.class.getResource("/../../resources/img");
			logger.info(Thumbnail.class.getResource("/").toString());
			rootPath = rootUrl.toString().substring(6).replaceAll("/", "\\"+File.separator);
		}
	}
	
	public static Thumbnail getInstance(){
		return ThumbnailHolder.instance;
	}
	
	public String makeThumbnail(String imgurl) throws IOException{

		String imgPath = imgurl.replaceAll("/", "\\"+File.separator);
		
		int typeIdx = imgPath.lastIndexOf('.');
		String imgPathTemp = imgPath.substring(0, typeIdx);
		String type = imgPath.substring(typeIdx+1);
		String thumbPath = rootPath+imgPathTemp+"_th."+type;
		
		File thumbFile = new File(thumbPath);
		if(!thumbFile.exists()){
			logger.info("make thumbnail");
			
			File imgFile = new File(rootPath + imgPath);
			logger.info(rootPath+imgPath);
			BufferedImage img = ImageIO.read(imgFile);
			
			BufferedImage thumbImg = Scalr.resize(img, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
			
			ImageIO.write(thumbImg, type, thumbFile);
		}
		
		String ret = "/img/"+imgurl.substring(0, imgurl.lastIndexOf("."))+"_th."+type;
		logger.info(ret);
		return ret;
	}
	
}
