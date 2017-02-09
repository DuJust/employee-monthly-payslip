task all_specs: :environment do
  Rake::Task['spec'].invoke
  Rake::Task['teaspoon'].invoke
end

task default: :all_specs
