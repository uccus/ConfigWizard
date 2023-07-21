#include  <QString>
#include "QtFloatValidator.h"

QtFloatValidator::QtFloatValidator(QObject *parent)
    : QDoubleValidator(parent)
{
}

QtFloatValidator::QtFloatValidator(std::string currentValue, double bottom, double top, int decimals, QObject *parent)
    : QDoubleValidator(bottom, top, decimals, parent)
{
	m_currentValue = currentValue;
}

QtFloatValidator::~QtFloatValidator()
{

}

// void QtFloatValidator::fixup(QString & s) const
// {
// 	QString strMsg_1 = QObject::tr("错误");
// 	QString strMsg_2 = "";
// 	QString strMsg_3 = QObject::tr("确定");
// 	bool ok = false;
// 	double val = s.toDouble(&ok);

// 	if (s.isEmpty() || s == "-")
// 	{
// 		s = QString::fromStdString(m_currentValue);
// 		strMsg_2.sprintf(QObject::tr("当前参数输入值为空，参数范围为[%s~%s]").toStdString().data(), to_string(bottom()).c_str(), to_string(top()).c_str());
// 	}
// 	else if (val < bottom())
// 	{
// 		s = QString::fromStdString(m_currentValue);
// 		strMsg_2.sprintf(QObject::tr("当前参数输入值越下界，参数范围为[%s~%s]").toStdString().data(), to_string(bottom()).c_str(), to_string(top()).c_str());
// 	}
// 	else if (val > top())
// 	{
// 		s = QString::fromStdString(m_currentValue);
// 		strMsg_2.sprintf(QObject::tr("当前参数输入值越上界，参数范围为[%s~%s]").toStdString().data(), to_string(bottom()).c_str(), to_string(top()).c_str());
// 	}

// 	QMessageBox::warning(0, strMsg_1,strMsg_2, strMsg_3);
// }

QValidator::State QtFloatValidator::validate(QString &s, int &n) const
{
	bool ok = false;
	double val = s.toDouble(&ok);

	//空输入，符号等基础限制
	if (s.isEmpty())
	{
		return QValidator::Intermediate;
	}
	if (bottom() >= 0 && s.startsWith('-'))
	{
		return Invalid;
	}
	int dotPos = s.indexOf(".");
	if (dotPos > 0 && s.right(s.length() - dotPos - 1).length() > decimals())
	{
		return Invalid;
	}
	if (!ok)
	{
		return (bottom() < 0 && !s.compare("-")) ? Intermediate : Invalid;
	}
	
	//数值范围限制
	if (val >= bottom() && val <= top())
	{
		return Acceptable;
	}
	else if(val < bottom())
	{
		return Intermediate;
	}
	else if(val > top())
	{
		return Intermediate;
	}
	return Acceptable;
}