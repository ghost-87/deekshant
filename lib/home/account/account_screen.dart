import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deekshant_app/model/user_account_model.dart';
import 'package:deekshant_app/values/assets.dart';
import 'package:deekshant_app/values/base_colors.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<UserAccountModel> _userAccountItems = [
    UserAccountModel(SVGs.icOrders, 'Orders'),
    UserAccountModel(SVGs.icMyDetails, 'My Details'),
    UserAccountModel(SVGs.icDeliveryAddress, 'Delivery Address'),
    UserAccountModel(SVGs.icPaymentMethods, 'Payment Methods'),
    UserAccountModel(SVGs.icPromoCard, 'Promo Card'),
    UserAccountModel(SVGs.icNotificationBell, 'Notifications'),
    UserAccountModel(SVGs.icHelp, 'Help'),
    UserAccountModel(SVGs.icAbout, 'About'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UserHeader(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _userAccountItems.length,
              itemBuilder: (_, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                  leading: SvgPicture.asset(
                    _userAccountItems[index].leadingSvg,
                  ),
                  title: Text(
                    _userAccountItems[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: BaseColors.gray1,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next_rounded,
                    size: 32,
                    color: BaseColors.gray1,
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return Divider(
                  thickness: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 64,
          width: 64,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            child:
                Icon(Icons.sick, size: MediaQuery.of(context).size.width * 0.1),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'deekshant',
                style: const TextStyle(
                  color: BaseColors.gray1,
                  fontSize: 20,
                ),
              ),
              Text(
                'deekshant@gmail.com',
                style: const TextStyle(
                  color: BaseColors.darkGray,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
