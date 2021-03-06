xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path.match(/\.html/) }.each do |page|
    unless page.path.match(/404/) || page.path.match(/indigo/) || page.path.match(/sitemap/)
      xml.url do
        xml.loc "#{data.sitemap.url}#{page.url}"
        xml.lastmod Date.today.to_time.iso8601
        xml.changefreq page.data.changefreq || "monthly"
        xml.priority page.data.priority || "0.9"
      end
    end
  end
end
