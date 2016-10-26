RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created artist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates an existing playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}

        expect(assigns(:playlist)).to have_attributes(name: "New name")
      end
      it "assigns the requested artist as @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the artist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "New name")}
        expect(response).to redirect_to(playlist)
      end
    end
  end
end
