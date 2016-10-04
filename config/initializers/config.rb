config = YAML.load_file("#{Rails.root.to_s}/config/weeks.yml")

CONFIG_WEEK = config[Rails.application.secrets.week_id][Rails.env]