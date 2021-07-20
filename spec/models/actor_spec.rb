require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'associations' do
    it { should belong_to(:country).class_name('Country') }
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end
end 