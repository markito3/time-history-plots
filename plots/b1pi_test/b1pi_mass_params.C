{
  TFile *F1 = new TFile("hd_root.root");
  TH1I *x_mass_hist = (TH1I*)F1->Get("b1pi/Custom_HistMass_X_2000/InvariantMass");
  x_mass_hist->Draw();
}
