
{{- define "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.fullname" -}}
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


{{- define "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.labels" -}}
helm.sh/chart: {{ include "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.chart" . }}
{{ include "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo00ca22d9-1109-45e9-9308-ad877e6062ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}