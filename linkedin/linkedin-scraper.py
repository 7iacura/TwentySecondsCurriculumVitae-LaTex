
# import os, sys, io, time, datetime
# from threading import Timer
# import csv
from string import whitespace
# try:
# 	import Image, ImageEnhance
# except ImportError:
# 	from PIL import Image, ImageEnhance
# import pytesseract
import urllib, urllib2, cookielib
# from urllib import quote_plus
from bs4 import BeautifulSoup

# from pymongo import MongoClient

# import smtplib, email.utils
# from email.mime.text import MIMEText

# import thread

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import *
import signal

# ---------------------------------------------------------------------------- #
# ############################################################################ #
# ---------------------------------------------------------------------------- #

# 	def scraper_img(self, t):
# 		try:
# 			# page = urllib2.urlopen(self.ixp.url)
# 			hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64)',
# 				   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
# 				   'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
# 				   'Accept-Encoding': 'none',
# 				   'Connection': 'keep-alive'}
# 			req = urllib2.Request(self.ixp.url, headers=hdr)
# 			page = urllib2.urlopen(req)
# 		except:
# 			raise Ixp_Exception(2)
# 		try:
# 			soup = BeautifulSoup(page.read(), 'html.parser')
# 		except:
# 			raise Ixp_Exception(3)

# 		if len(soup.find_all('img')) == 0:
# 			raise Ixp_Exception(4)

# 		for img in soup.find_all('img'):
# # ---------------------------------------------------------------------------- #
# 			# print str(img)
# # ---------------------------------------------------------------------------- #
# 			if self.ixp.daily_string in str(img):
# 				if self.ixp.url_radix:
# 					image_url = str(self.ixp.url_radix + img.get('src'))
# 				else:
# 					image_url = str(img.get('src'))
# 				data = self.export_data(image_url, t)
# 				if data != None:
# 					self.storeVtable[self.storeMode](self.ixp.name, t, data[0], data[1])					
# 					if self.ixp.info_data:
# 						msg = '[%s][%s](%s) - (%s)' %(str(data[0]), str(data[1]), self.ixp.unit, self.ixp.name)
# 						log(msg, 0)
# 				break

# 	def export_data(self, link_image, t):
# 		image = None
# 		try:
# 			image = self.elaborate_image(link_image, t)
# 		except Ixp_Exception as e:
# 			msg = '%s - (%s)' %(e.message(), self.ixp.name)
# 			log(msg, 2)
# 			return None
# 		try:
# 			ocr = self.ocr_image(image)
# 			return ocr
# 		except Ixp_Exception as e:
# 			msg = '%s - (%s)' %(e.message(), self.ixp.name)
# 			log(msg, 2)
# 			return None

# 	def elaborate_image(self, image_link, t):
# # ---------------------------------------------------------------------------- #
# 		# print str(image_link)
# # ---------------------------------------------------------------------------- #
# 		try:
# 			# image_url = urllib2.urlopen(image_link)
# 			# image_file = io.BytesIO(image_url.read())
# 			hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64)',
# 				   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
# 				   'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
# 				   'Accept-Encoding': 'none',
# 				   'Connection': 'keep-alive'}
# 			req = urllib2.Request(image_link, headers=hdr)
# 			image_url = urllib2.urlopen(req)
# 			image_file = io.BytesIO(image_url.read())
# 		except:
# 			raise Ixp_Exception(5)
# 		try:
# 			image = Image.open(image_file)
# 		except:
# 			raise Ixp_Exception(6)
# 		new_path = 'ixp_images/'+ self.ixp.name +'.jpg'
# 		basewidth = self.ixp.size_image
# 		wpercent = (basewidth/float(image.size[0]))
# 		hsize = int((float(image.size[1])*float(wpercent)))
# 		image = image.resize((basewidth,hsize), Image.ANTIALIAS)

# 		try:
# 			image.save(new_path)
# 		except:
# 			raise Ixp_Exception(7)
# 		if self.ixp.do_enhance:
# 			image = Image.open(new_path)
# 			enhancer = ImageEnhance.Contrast(image)
# 			image = enhancer.enhance(1.5)
# 			image.save(new_path)
# 		return image

# 	def ocr_image(self, image):
# 		try:
# 			cin = -1 
# 			cout = -1
# 			image_string = pytesseract.image_to_string(image, lang='eng')
# 			image_string.translate(None, whitespace)			
# # ---------------------------------------------------------------------------- #
# 			# print(image_string)
# # ---------------------------------------------------------------------------- #
# 			if image_string.find(self.ixp.current_in) != -1:
# 				x = image_string.find(self.ixp.current_in)
# 				cin = image_string[x+self.ixp.current_in_offset[0]:x+self.ixp.current_in_offset[1]].translate(None, whitespace)
# 			else:
# 				raise Ixp_Exception(9)
# 			if image_string.find(self.ixp.current_out) != -1:
# 				x = image_string.find(self.ixp.current_out)
# 				cout = image_string[x+self.ixp.current_out_offset[0]:x+self.ixp.current_out_offset[1]].translate(None, whitespace)
# 			else:
# 				raise Ixp_Exception(9)
# 			return cin, cout
# 		except:
# 			raise Ixp_Exception(8)

# 	def scraper_plain_txt(self, t):
# 		try:
# 			# page = urllib2.urlopen(self.ixp.url)
# 			hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64)',
# 				   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
# 				   'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
# 				   'Accept-Encoding': 'none',
# 				   'Connection': 'keep-alive'}
# 			req = urllib2.Request(self.ixp.url, headers=hdr)
# 			page = urllib2.urlopen(req)
# # ---------------------------------------------------------------------------- #
# 			# print page.read()
# # ---------------------------------------------------------------------------- #
# 		except:
# 			raise Ixp_Exception(2)
# 		try:
# 			soup = BeautifulSoup(page.read(), 'html.parser')
# 		except:
# 			raise Ixp_Exception(3)
# 		html = soup.get_text()
# 		if html.find(self.ixp.current_in) != -1:
# 			x = html.find(self.ixp.current_in)			
# 			cin = html[x+self.ixp.current_in_offset[0]:x+self.ixp.current_in_offset[1]]
# 			cin = str(cin).translate(None, whitespace)
# 		else:
# 			raise Ixp_Exception(9)
# 		if html.find(self.ixp.current_out) != -1:
# 			x = html.find(self.ixp.current_out)			
# 			cout = html[x+self.ixp.current_out_offset[0]:x+self.ixp.current_out_offset[1]]
# 			cout = str(cout).translate(None, whitespace)
# 		else:
# 			raise Ixp_Exception(9)
# 		self.storeVtable[self.storeMode](self.ixp.name, t, cin, cout)
# 		if self.ixp.info_data:
# 			msg = '[%s][%s](%s) - (%s)' %(cin, cout, self.ixp.unit, self.ixp.name)
# 			log(msg, 0)

myurl = 'https://www.linkedin.com/in/mattia-curatitoli-5b036867'
	
# hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64)',
# 	   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
# 	   'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
# 	   'Accept-Encoding': 'none',
# 	   'Connection': 'keep-alive'}
# req = urllib2.Request(myurl, headers=hdr)
# page = urllib2.urlopen(req).read()
page = urllib2.urlopen(myurl).read()
print page


