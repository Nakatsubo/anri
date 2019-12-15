module ApplicationHelper
  # set_meta_tag
  # OGP画像とアカウントを作成する
  def default_meta_tags
    {
      title:       'title',
      description: 'description',
      keywords:    'rails,seo,meta-tags',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('apple-touch-icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      noindex: ! Rails.env.production?,
	    canonical: request.original_url,
      charset: 'UTF-8',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # image: image_url('sample_og.png'),
        site_name: 'ANRI - Agencies Notice Rescue Information',
        locale: 'ja_JP'
      }# ,
      # twitter: {
      #   site: 'Twitter account name',
      #   card: 'summary',
      #   image: image_url('sample_twitter.png')
	    # },
      # fb: {
      #   app_id: '***************'
      # }
    }
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def set_photo_uri(key)
    'https://anri-development.s3-ap-northeast-1.amazonaws.com/' + key
  end

  def convert_time(time)
    time.strftime("%p%I:%M・%Y年%m月%d日")
  end
end
