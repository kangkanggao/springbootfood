/**
 * gkk
 */
package cn.edu.nyist.milk.utils;

import java.io.File;
import java.util.Iterator;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParseConfigXmlUtil {
	private static final Logger logger = LoggerFactory.getLogger(ParseConfigXmlUtil.class);

	public static Config load(String configFile) {
		return load(new Config(), new File(configFile), true);
	}

	private static Config load(Config config, File configFile, boolean superFile) {

		if (!configFile.exists()) {
			logger.error("file {} not exist, ignore", configFile.getPath());
			return config;
		}

		try {
			Document document = new SAXReader().read(configFile);
			Element root = document.getRootElement();

			Iterator<?> i = root.elementIterator();
			while (i.hasNext()) {
				readElement(config, "", (Element) i.next(), false);
			}
			return config;
		} catch (DocumentException e) {
			logger.error("load file {} exception : {}", configFile.getPath(), e.toString());
			return config;
		}
	}

	private static void readProperty(Config config, String parent, Element e, boolean splice) {

		String pn = e.attributeValue("name");
		String pv = e.attributeValue("value");
		if (StringUtils.isBlank(pn)) {
			logger.error("not found name in property");
			return;
		} else if (pv == null) {
			pv = "";
		}
		if (splice) {
			pn = parent + pn;
		}
		config.getProperties().setProperty(pn, pv);
		return;
	}

	private static void readElement(Config config, String parent, Element e, boolean splice) {
		String name = e.getName();
		switch (name) {
		case "property":
			readProperty(config, parent, e, splice);
			return;
		}

		logger.debug("reading element : {} ", name);
		String s = e.attributeValue("splice");
		if (StringUtils.isBlank(s) || !s.equals("true")) {
			splice = false;
		} else {
			splice = true;
		}
		Iterator<?> i = e.elementIterator();
		while (i.hasNext()) {
			readElement(config, name, (Element) i.next(), splice);
		}
		logger.debug("reading element : {} end", name);
		return;
	}
	public static void main(String[] args) {
		Config load = load("./conf/config.xml");
		System.out.println(load.getProperties());
	}
}
