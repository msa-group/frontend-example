import { Outlet, Link, useLocation } from 'ice';
import ProLayout from '@ant-design/pro-layout';
import { asideMenuConfig } from '@/menuConfig';
import AvatarDropdown from '@/components/AvatarDropdown';
import store from '@/store';
import logo from '@/assets/logo.png';
import styles from './layout.module.css';
import Footer from '@/components/Footer';
import version from '@/version';
import { Space } from 'antd';
import { CodeSandboxOutlined } from '@ant-design/icons';


export default function Layout() {
  const location = useLocation();
  const [userState] = store.useModel('user');

  if (['/login'].includes(location.pathname)) {
    return <Outlet />;
  }

  return (
    <ProLayout
			contentStyle={{ backgroundColor: version === "gray" ? "#ddd": 'transparent'}}
      menu={{ defaultOpenAll: true }}
      className={styles.layout}
      logo={<img src={logo} alt="logo" />}
      title={`ICE Pro ${version}`}
      location={{
        pathname: location.pathname,
      }}
      layout="mix"
      rightContentRender={() => (
				<Space>
					<a href='/example'>
						<CodeSandboxOutlined style={{marginRight: 4}} />
						示例应用
					</a>
					<AvatarDropdown avatar={userState.currentUser.avatar} name={userState.currentUser.name} />
				</Space>
      )}
      menuDataRender={() => asideMenuConfig}
      menuItemRender={(item, defaultDom) => {
        if (!item.path) {
          return defaultDom;
        }
        return <Link to={item.path}>{defaultDom}</Link>;
      }}
      footerRender={() => <Footer />}
    >
      <Outlet />
    </ProLayout>
  );
}
