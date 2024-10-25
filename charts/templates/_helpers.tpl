
{{- define "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.fullname" -}}
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


{{- define "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.labels" -}}
helm.sh/chart: {{ include "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.chart" . }}
{{ include "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57691580-8664-40c0-bb87-9d45fad8e42d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}