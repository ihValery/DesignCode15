//
//  AccountView.swift
//  DesignCode
//
//  Created by Валерий Игнатьев on 3.05.22.
//

import SwiftUI

//MARK: - AccountView

struct AccountView: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let offsetHexagon: CGSize = .init(width: -50, height: -100)
        static let offsetBlob: CGSize = .init(width: 200, height: 0)
        static let sizeFontHexagon: Font = .system(size: 200)
        static let sizeFontPerson: Font = .system(size: 32)
    }

    //MARK: Properties

    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle(GlobalConstant.Account.navigationTitle)
        }
    }
    
    private var profile: some View {
        VStack(spacing: GlobalConstant.Padding.step8) {
            GlobalConstant.Account.systemImagePerson
                .font(InternalConstant.sizeFontPerson)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    GlobalConstant.Account.systemImageHexagon
                        .foregroundColor(.blue)
                        .font(InternalConstant.sizeFontHexagon)
                        .offset(InternalConstant.offsetHexagon)
                )
                .background(
                    BlobView()
                        .offset(InternalConstant.offsetBlob)
                        .scaleEffect(0.6)
                )
            
            Text(GlobalConstant.Account.name)
                .font(.title.weight(.semibold))
            HStack {
                GlobalConstant.Account.systemImageLocation
                    .imageScale(.small)
                Text(GlobalConstant.Account.location)
            }
            .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private var menu: some View {
        Section {
            NavigationLink {
                EmptyView()
            } label: {
                GlobalConstant.Account.sectionSettings
            }
            
            NavigationLink {
                EmptyView()
            } label: {
                GlobalConstant.Account.sectionBilling
            }
            
            NavigationLink {
                EmptyView()
            } label: {
                GlobalConstant.Account.sectionHelp
            }
        }
        .foregroundStyle(.primary)
        .listRowSeparator(.hidden)
    }
    
    private var links: some View {
        Section {
            Link(destination: GlobalConstant.Account.linkWebsite) {
                HStack {
                    GlobalConstant.Account.sectionWebsite
                    Spacer()
                    GlobalConstant.Account.systemImageLink
                        .foregroundColor(.secondary)
                }
            }
            Link(destination: GlobalConstant.Account.linkYoutube) {
                HStack {
                    GlobalConstant.Account.sectionYoutube
                    Spacer()
                    GlobalConstant.Account.systemImageLink
                        .foregroundColor(.secondary)
                }
            }
        }
        .foregroundStyle(.primary)
        .listRowSeparator(.hidden)
    }
}

//MARK: - PreviewProvider

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
