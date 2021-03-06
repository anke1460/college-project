require 'spec_helper'

shared_examples '/api/v1/applicant/job_requests - logged in as an admin' do |args, factories|

  resource = 'applicant/job_requests'
  url = "/api/v1/#{resource}"

  context 'allowed' do
    it_behaves_like 'controllers/create', *(args + [factories])
  end

  context 'not allowed' do
    after { expect(response.status).to eq(401) }

    context 'index' do
      it { get url }
    end
    context 'show' do
      it { get "#{url}/99" }
    end
    context 'update' do
      it { put "#{url}/99" }
    end
    context 'destroy' do
      it { delete "#{url}/99" }
    end

    context 'decidable' do
      it { put "#{url}/99/accept" }
      it { put "#{url}/99/reject" }
    end
  end

  context 'current user user deleted while logged in' do
    it_behaves_like 'accountable - logged in - deleted', resource, (args + [factories])
  end
end
