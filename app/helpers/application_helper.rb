module ApplicationHelper
  # set_meta_tag
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

  # judge_current_user
  def logged_in?
    current_user.present?
  end
end
