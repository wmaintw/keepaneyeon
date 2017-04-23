require 'nokogiri'
require 'open-uri'
require 'json'

helpers do

  def kindle_instock?
    doc = get_web_page('http://ffp.sichuanair.com/FFPNewWeb/Mall/Detail/6562')
    instock?(get_stock_info(doc))
  end

  def something_instock?
    doc = get_web_page('http://ffp.sichuanair.com/FFPNewWeb/Mall/Detail/9606')
    instock?(get_stock_info(doc))
  end

  def get_web_page(uri)
    Nokogiri::HTML(open(uri))
  end

  def get_stock_info(doc)
    doc.search('//*[@id="div_right"]/div[1]/div[2]/div[2]/span')[0].content
  end

  def instock?(stock_info)
    stock_status = {}
    stock_status['instock'] = (stock_info != '当前商品已兑换完! ')

    stock_status
  end
end
