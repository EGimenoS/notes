require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe 'notes#index' do
    it "should succesfully respond" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'notes#create' do
    before do
      post :create, params: {note: {title: 'First', content: 'Hello'}}
    end
      
    it 'should return 200 status code' do 
      expect(response).to be_success
    end

    it 'should succesfully create and save a new note in the database' do
      note = Note.last
      expect(note.content).to eq('Hello')
      expect(note.title).to eq('First')
    end

    it 'should return the created note in response body' do
      json = JSON.parse(response.body)
      expect(json['content']).to eq ('Hello')
      expect(json['title']).to eq ('First')
    end
  
  end


end
