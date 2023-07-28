//
//  RegisterView.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = RegisterViewModel()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State private var birthday: Date = Calendar.current.date(byAdding: DateComponents(year: -30), to: Date()) ?? Date()
    @State var nationality: String = ""
    @State var residence: String = ""
    @State var mobileNumber: String = ""
    @State private var selectedDate = Date()
    @State private var isSelectedBirthday = false
    
    @State var preselectedIndex = 0
    @State var selectedGender: Gender = .female
    
    @State private var isCountryPickerPresented = false
    @State private var selectedCountry: (name: String, code: String)?

    
    var body: some View {
        VStack(spacing: 0) {
            Back()
            ScrollView(.vertical, showsIndicators: false) {
                InfoText()
                VStack(spacing: 15) {
                    FirstName()
                    LastName()
                    EmailAddress()
                    DOB()
                    Nationality()
                    Residence()
                    MobileNumber()
                    CreateNewAccount()
                }
                .padding()
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }.sheet(isPresented: $isCountryPickerPresented) {
            CountryPickerDialogView(isPresented: $isCountryPickerPresented, selectedCountry: $selectedCountry, countryCodes: viewModel.countryCodes)
        }
        
    }
    
    @ViewBuilder
    func Back() -> some View{
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(Constant.primaryTextColor)
            }
            Spacer()
        }
        .padding()
        .background(Rectangle().foregroundColor(Constant.grayBG).ignoresSafeArea())
    }
    
    @ViewBuilder
    func InfoText() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Almost there!")
                .withTitleTextFormatting()
            Text("Complete the form below to create your Ready To Travel account.")
                .withNormalTextFormatting()
            Text("* Mandatory")
                .withSmallTextFormatting()
        }
        .padding()
        .background(Rectangle().foregroundColor(Constant.grayBG))
    }
    
    @ViewBuilder
    func FirstName() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("First Name *")
                .withSmallTextFormatting()
                .padding(.bottom, 8)
            VStack {
                TextField("", text: $firstName, onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.validate(firstName: firstName)
                    }else {
                        viewModel.isFirstNameValid = true
                    }
                })
                .foregroundColor(viewModel.isFirstNameValid ? .primary : .red)
                .withNormalTextFormatting()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(viewModel.isFirstNameValid ? .gray : .red)
            }
            if !viewModel.isFirstNameValid {
                Text("Please enter your first name")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
    }
    
    @ViewBuilder
    func LastName() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Last Name *")
                .withSmallTextFormatting()
                .padding(.bottom, 8)
            VStack {
                TextField("", text: $lastName, onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.validate(lastName: lastName)
                    }else {
                        viewModel.isLastNameValid = true
                    }
                })
                .foregroundColor(viewModel.isLastNameValid ? .primary : .red)
                .withNormalTextFormatting()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(viewModel.isLastNameValid ? .gray : .red)
            }
            if !viewModel.isLastNameValid {
                Text("Please enter your last name")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
    }
    
    @ViewBuilder
    func EmailAddress() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Email Address *")
                .withSmallTextFormatting()
                .padding(.bottom, 8)
            VStack {
                TextField("", text: $email, onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.validate(email: email)
                    }else {
                        viewModel.isEmailValid = true
                    }
                })
                .foregroundColor(viewModel.isEmailValid ? .primary : .red)
                .withNormalTextFormatting()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(viewModel.isEmailValid ? .gray : .red)
            }
            if !viewModel.isEmailValid {
                Text("Please enter your valid email address")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
    }
    
    @ViewBuilder
    func DOB() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Date of Birth *")
                        .withSmallTextFormatting()
                        .padding(.bottom, 8)
                    
                    HStack{
                        if isSelectedBirthday {
                            Text("\(birthday, formatter: dateFormatter)")
                                .withNormalTextFormatting()
                                .padding(.leading, 5)
                        } else {
                            Text("DD/MM/YYYY")
                                .foregroundColor(viewModel.isDOBValid ? .primary : .red)
                                .withNormalTextFormatting()
                        }
                        Spacer()
                        
                        ZStack {
                            Image("dob")
                            
                            DatePicker(
                                "",
                                selection: $birthday,
                                displayedComponents: [.date]
                            )
                            .blendMode(.destinationOver)
                            .onChange(of: birthday, perform: { value in
                                isSelectedBirthday = true
                                viewModel.isDOBValid = true
                            })
                        }
                        .frame(maxWidth: 20, maxHeight: 20)
                        .padding(.trailing, 6)
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(viewModel.isDOBValid ? .gray : .red)
                        .padding(.top, 4)
                    
                    
                }
                
                CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: [Gender.female.rawValue, Gender.male.rawValue])
            }
            if !viewModel.isDOBValid {
                Text("Please enter select your date of birth")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
        
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    @ViewBuilder
    func Nationality() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Nationality *")
                .withSmallTextFormatting()
                .padding(.bottom, 8)
            VStack {
                TextField("", text: $nationality, onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.validate(nationality:nationality)
                    }else {
                        viewModel.isNationalityValid = true
                    }
                })
                .foregroundColor(viewModel.isNationalityValid ? .primary : .red)
                .withNormalTextFormatting()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(viewModel.isNationalityValid ? .gray : .red)
            }
            if !viewModel.isNationalityValid {
                Text("Please enter your nationality")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
    }
    
    @ViewBuilder
    func Residence() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Country of Residence *")
                .withSmallTextFormatting()
                .padding(.bottom, 8)
            VStack {
                TextField("", text: $residence, onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.validate(country: residence)
                    }else {
                        viewModel.isCountryValid = true
                    }
                })
                .foregroundColor(viewModel.isCountryValid ? .primary : .red)
                .withNormalTextFormatting()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(viewModel.isCountryValid ? .gray : .red)
            }
            if !viewModel.isCountryValid {
                Text("Please enter your country of residence")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
            
        }
    }
    
    @ViewBuilder
    func MobileNumber() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Mobile no.(Optional)")
                .withSmallTextFormatting()
            
            HStack {
                
                Button(selectedCountry?.code ?? "+95") {
                    isCountryPickerPresented = true
                }.foregroundColor(.primary)
                
                Divider().padding(.vertical,2)
                TextField("", text: $mobileNumber)
                    .keyboardType(.numberPad)
                    .withNormalTextFormatting()
            }.padding(.vertical, 8)
            Divider()
            
            
        }
    }
    
    @ViewBuilder
    func CreateNewAccount() -> some View {
        Button {
            viewModel.validateAndSubmit(firstName: firstName, lastName: lastName, email: email, isDOBSelected: isSelectedBirthday, nationality: nationality, country: residence)
        } label: {
            Text("Create my account now")
        }
        .buttonStyle(GradientButtonStyle())
        .padding(.vertical)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

