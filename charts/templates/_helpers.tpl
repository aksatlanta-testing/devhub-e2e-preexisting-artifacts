
{{- define "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.fullname" -}}
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


{{- define "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.labels" -}}
helm.sh/chart: {{ include "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.chart" . }}
{{ include "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo07c59dc4-1b12-48ae-8b58-aea81444ab12.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}