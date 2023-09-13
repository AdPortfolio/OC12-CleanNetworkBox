//
//  CreateCompanyModels.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 12/08/2023.

import UIKit

enum CreateCompany {
    
    struct OrderFormFields {
        var companyName: String?
        var functionName: String?
    }
    
    enum CompanyField {
        struct Request {
            var companyName: String?
        }
    }
    
    enum FunctionField {
        struct Request {
            var functionName: String?
        }
    }
}

