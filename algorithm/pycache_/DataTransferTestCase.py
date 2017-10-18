# -*- coding: utf-8 -*-

import urllib.request
import json

class DataTransferTestCase(object):

	def __init__(self, url):
		self.url = url

	
	def set_message_push_config_test(self):
		url = self.url + 'DataTransferSetMessagePushConfig'
		jroot = {}
		jroot['msg_code'] = 'valueType=long long'
		postData = json.dumps(jroot)
		print("test for set_message_push_config")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_webfilter_contents_test(self, path):
		url = self.url + 'DataTransferSetWebfilterContents' + path
		jroot = {}
		jarray = list()
		contents_0 = {}
		contents_0['is_attr'] = 'valueType=bool'
		contents_0['path'] = 'valueType=std::string'
		contents_0['name'] = 'valueType=std::string'
		contents_0['value'] = 'valueType=std::string'
		jarray.append(contents_0)
		contents_1 = {}
		contents_1['is_attr'] = 'valueType=bool'
		contents_1['path'] = 'valueType=std::string'
		contents_1['name'] = 'valueType=std::string'
		contents_1['value'] = 'valueType=std::string'
		jarray.append(contents_1)
		jroot['contents'] = jarray
		postData = json.dumps(jroot)
		print("test for set_webfilter_contents")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def get_message_push_config_test(self):
		url = self.url + 'DataTransferGetMessagePushConfig'
		print("test for get_message_push_config")
		response = urllib.request.urlopen(url)
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_user_pay_function_test(self):
		url = self.url + 'DataTransferSetUserPayFunction'
		jroot = {}
		jroot['user_name'] = 'valueType=std::string'
		jroot['token'] = 'valueType=std::string'
		jroot['func'] = 'valueType=std::string'
		jroot['opcode'] = 'valueType=unsigned int'
		postData = json.dumps(jroot)
		print("test for set_user_pay_function")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def get_webfilter_config_test(self, path):
		url = self.url + 'DataTransferGetWebfilterConfig' + path
		jroot = {}
		postData = json.dumps(jroot)
		print("test for get_webfilter_config")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def get_conf_file_md5_test(self):
		url = self.url + 'DataTransferGetConfFileMd5'
		jroot = {}
		jroot['file_path'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for get_conf_file_md5")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_webfilter_text_test(self, path):
		url = self.url + 'DataTransferSetWebfilterText' + path
		jroot = {}
		jroot['name'] = 'valueType=std::string'
		jroot['value'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for set_webfilter_text")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def notify_web_filter_conf_change_test(self):
		url = self.url + 'DataTransferNotifyWebFilterConfChange'
		jroot = {}
		jroot['name'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for notify_web_filter_conf_change")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def query_user_pay_function_test(self):
		url = self.url + 'DataTransferQueryUserPayFunction'
		jroot = {}
		jroot['user_name'] = 'valueType=std::string'
		jroot['token'] = 'valueType=std::string'
		jroot['func'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for query_user_pay_function")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_webfilter_attr_test(self, path):
		url = self.url + 'DataTransferSetWebfilterAttr' + path
		jroot = {}
		jroot['attribute_name'] = 'valueType=std::string'
		jroot['attribute_value'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for set_webfilter_attr")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def import_conf_test(self):
		url = self.url + 'DataTransferImportConf'
		jroot = {}
		jroot['rule_path'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for import_conf")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def restore_default_config_test(self):
		url = self.url + 'DataTransferRestoreDefaultConfig'
		jroot = {}
		jroot['file_name'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for restore_default_config")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def export_conf_test(self):
		url = self.url + 'DataTransferExportConf'
		jroot = {}
		jroot['rule_path'] = 'valueType=std::string'
		jroot['optional'] = 'valueType=unsigned int'
		postData = json.dumps(jroot)
		print("test for export_conf")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def add_webfilter_text_test(self, path):
		url = self.url + 'DataTransferAddWebfilterText' + path
		jroot = {}
		jroot['name'] = 'valueType=std::string'
		jroot['value'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for add_webfilter_text")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def get_webfilter_power_test(self):
		url = self.url + 'DataTransferGetWebfilterPower'
		jroot = {}
		path = list()
		path.append('valueType=std::string')
		path.append('valueType=std::string')
		jroot['path'] = path
		postData = json.dumps(jroot)
		print("test for get_webfilter_power")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def del_webfilter_config_by_xpath_test(self, path):
		url = self.url + 'DataTransferDelWebfilterConfigByXpath' + path
		jroot = {}
		postData = json.dumps(jroot)
		print("test for del_webfilter_config_by_xpath")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def fast_small_data_transfer_write_test(self):
		url = self.url + 'DataTransferFastSmallDataTransferWrite'
		jroot = {}
		jroot['name'] = 'valueType=std::string'
		jroot['data'] = 'valueType=unsigned char'
		postData = json.dumps(jroot)
		print("test for fast_small_data_transfer_write")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_webfilter_config_test(self, path):
		url = self.url + 'DataTransferSetWebfilterConfig' + path
		jroot = {}
		jroot['op_code'] = 'valueType=unsigned int'
		jroot['json_string'] = 'valueType=std::string'
		postData = json.dumps(jroot)
		print("test for set_webfilter_config")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)
	
	def set_webfilter_power_test(self):
		url = self.url + 'DataTransferSetWebfilterPower'
		jroot = {}
		path = list()
		path.append('valueType=std::string')
		path.append('valueType=std::string')
		jroot['path'] = path
		conf_power = list()
		conf_power.append('valueType=unsigned int')
		conf_power.append('valueType=unsigned int')
		jroot['conf_power'] = conf_power
		postData = json.dumps(jroot)
		print("test for set_webfilter_power")
		print(postData)
		response = urllib.request.urlopen(url, postData.encode('utf-8'))
		recvData = response.read().decode('utf-8')
		json.loads(recvData)
		print(recvData)


if __name__ == "__main__":

	obj = DataTransferTestCase("http://192.168.29.11:9090/")

	obj.set_message_push_config_test()

	obj.set_webfilter_contents_test()

	obj.get_message_push_config_test()

	obj.set_user_pay_function_test()

	obj.get_webfilter_config_test()

	obj.get_conf_file_md5_test()

	obj.set_webfilter_text_test()

	obj.notify_web_filter_conf_change_test()

	obj.query_user_pay_function_test()

	obj.set_webfilter_attr_test()

	obj.import_conf_test()

	obj.restore_default_config_test()

	obj.export_conf_test()

	obj.add_webfilter_text_test()

	obj.get_webfilter_power_test()

	obj.del_webfilter_config_by_xpath_test()

	obj.fast_small_data_transfer_write_test()

	obj.set_webfilter_config_test()

	obj.set_webfilter_power_test()
