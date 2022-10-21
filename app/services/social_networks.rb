class SocialNetworks

  def self.call
    config = YAML.load_file("#{Rails.root}/app/services/social_networks.yml")
    config['social_networks'].each_with_object({}) do |social_network, hash|
      response = Excon.get("#{config['base']}#{social_network}")
      raise StandardError.new(response, 'SocialNetWorkError') unless response.status == 200

      hash[social_network] = JSON.parse(response.body)
    rescue StandardError => e
      Rails.logger.error(e)
      next
    end.compact
  end
end
