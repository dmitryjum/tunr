require 'spec_helper'

describe UserShare do
 it { should validate_presence_of (:playlist) }
 it { should belong_to(:playlist)}
 it { should validate_presence_of(:user)} 
 it { should belong_to(:user)}
end