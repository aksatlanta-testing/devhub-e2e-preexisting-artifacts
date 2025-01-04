
{{- define "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.fullname" -}}
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


{{- define "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.labels" -}}
helm.sh/chart: {{ include "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.chart" . }}
{{ include "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99c888b8-40d6-44b9-8cdc-0e69f2493a44.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}