# frozen_string_literal: true

# Copyright 2020 ConvertKit, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RSpec.describe InstagramBasicDisplay::Configuration do

  subject { InstagramBasicDisplay::Auth.new() }

  it 'pulls variables from global configuration' do
    expect(subject.configuration.client_id).to eq 'mock_client_id'
    expect(subject.configuration.client_secret).to eq 'mock_secret'
    expect(subject.configuration.redirect_uri).to eq 'mock_redirect_uri'
  end

  it 'allow to rewrite some of the variables locally' do

    subject = InstagramBasicDisplay::Auth.new(nil, "different_mock_secret")

    expect(subject.configuration.client_id).to eq 'mock_client_id'
    expect(subject.configuration.client_secret).to eq 'different_mock_secret'
    expect(subject.configuration.redirect_uri).to eq 'mock_redirect_uri'
  end


  it 'allows variables to be overwritten' do
    subject.configuration.client_id = 'different_client_id'
    expect(subject.configuration.client_id).to eq 'different_client_id'
  end
end
