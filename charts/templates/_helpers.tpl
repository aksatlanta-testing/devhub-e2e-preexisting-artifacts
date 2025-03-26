
{{- define "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.labels" -}}
helm.sh/chart: {{ include "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.chart" . }}
{{ include "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedaded5a-8928-461e-94bc-dbca5be2436d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}