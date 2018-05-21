# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  config.before :each do
    # Common text used throughout application on headers, buttons, link, etc.
    @app_name = 'Collective'
    @welcome_message = 'Let\'s learn together.'
    @sign_up = 'Sign Up'
    @join = 'Join Discussion'
    @log_in = 'Log In'
    @log_out = 'Log out'

    # Set up a user or two
    # Admin
    @user1 = User.create!(first_name: 'The', last_name: 'Doctor',
                          email: 'tdoctor@tardis.com', password: 'CrimsonElevenDelightPetrichor',
                          is_teacher: true)

    @user2 = User.create!(first_name: 'Rory', last_name: 'Williams',
                          email: 'rwilliams@pandorica.com', password: '@my',
                          is_teacher: false)

    @user3 = User.create!(first_name: 'Amy', last_name: 'Pond',
                          email: 'apond@pandorica.com', password: 'R@ggedyMan',
                          is_teacher: false)
      def log_the_doctor_in
        visit login_path

        fill_in :email, with: @user1.email
        fill_in :password, with: @user1.password
        click_button 'Log In'
      end
  end
=begin
  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
