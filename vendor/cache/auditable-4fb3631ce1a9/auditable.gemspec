# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "auditable"
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Harley Trung"]
  s.date = "2013-08-25"
  s.description = "A simple gem that audit ActiveRecord models' attributes or methods by taking snapshots and diff them for you. Starting from scratch to work with Rails 3.2.2 onwards"
  s.email = ["harley@socialsci.com"]
  s.files = [".gitignore", ".rspec", ".rvmrc", ".travis.yml", ".yardopts", "CHANGELOG.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "auditable.gemspec", "lib/auditable.rb", "lib/auditable/audit.rb", "lib/auditable/auditing.rb", "lib/auditable/base.rb", "lib/auditable/version.rb", "lib/generators/auditable/migration_generator.rb", "lib/generators/auditable/templates/migration.rb", "lib/generators/auditable/templates/update.rb", "lib/generators/auditable/update_generator.rb", "spec/lib/auditable_spec.rb", "spec/lib/callbacks_spec.rb", "spec/lib/changed_by_spec.rb", "spec/lib/snap_spec.rb", "spec/lib/version_spec.rb", "spec/spec_helper.rb", "spec/support/models.rb", "spec/support/schema.rb", "specs.watchr"]
  s.homepage = "https://github.com/harleyttd/auditable"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "A simple gem to audit attributes and methods in ActiveRecord models."
  s.test_files = ["spec/lib/auditable_spec.rb", "spec/lib/callbacks_spec.rb", "spec/lib/changed_by_spec.rb", "spec/lib/snap_spec.rb", "spec/lib/version_spec.rb", "spec/spec_helper.rb", "spec/support/models.rb", "spec/support/schema.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
      s.add_development_dependency(%q<watchr>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<kramdown>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2"])
      s.add_dependency(%q<watchr>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<kramdown>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<activerecord>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2"])
    s.add_dependency(%q<watchr>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<kramdown>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<activerecord>, [">= 3.0"])
  end
end
