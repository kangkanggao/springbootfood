/**
 * gkk
 */
package cn.edu.nyist.milk.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Config {

	private Properties props = new Properties();
	private List<SpringBeanConfigFile> springBeanConfigFileList = new ArrayList<>();

	public String getProperty(String key) {
		return props.getProperty(key);
	}

	public Properties getProperties() {
		return props;
	}

	public String setProperty(String key, String value) {
		return (String) props.setProperty(key, value);
	}

	public void setProperties(String key, String value) {
		this.props.setProperty(key, value);
	}

	public List<SpringBeanConfigFile> getSpringBeanConfigFileList() {
		return this.springBeanConfigFileList;
	}

	public void addSpringBeanConfigFile(boolean isClassPathFile, String filename) {
		springBeanConfigFileList.add(new SpringBeanConfigFile(isClassPathFile, filename));
	}

	public static class SpringBeanConfigFile {
		boolean isClassPathFile;
		String filename;

		SpringBeanConfigFile(boolean isClassPathFile, String filename) {
			this.isClassPathFile = isClassPathFile;
			this.filename = filename;
		}

		public boolean isClassPathFile() {
			return isClassPathFile;
		}

		public String getFilename() {
			return filename;
		}
	}
}
