
{{- define "go-echod1198edf-180e-43d8-8377-20f5040692d6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1198edf-180e-43d8-8377-20f5040692d6.fullname" -}}
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


{{- define "go-echod1198edf-180e-43d8-8377-20f5040692d6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1198edf-180e-43d8-8377-20f5040692d6.labels" -}}
helm.sh/chart: {{ include "go-echod1198edf-180e-43d8-8377-20f5040692d6.chart" . }}
{{ include "go-echod1198edf-180e-43d8-8377-20f5040692d6.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1198edf-180e-43d8-8377-20f5040692d6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1198edf-180e-43d8-8377-20f5040692d6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}