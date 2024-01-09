enum ProductType { all, leatherProducts, watches }

extension ProductTypeUtils on ProductType {
  String getLabel() {
    switch (this) {
      case ProductType.all:
        return 'All';
      case ProductType.leatherProducts:
        return 'Leather Products';
      case ProductType.watches:
        return 'Watches';
    }
  }
}
