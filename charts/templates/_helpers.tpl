
{{- define "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.fullname" -}}
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


{{- define "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.labels" -}}
helm.sh/chart: {{ include "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.chart" . }}
{{ include "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6c5ef9c-76df-44e9-8e1c-fb8460ecf73a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}