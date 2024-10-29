
{{- define "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.fullname" -}}
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


{{- define "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.labels" -}}
helm.sh/chart: {{ include "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.chart" . }}
{{ include "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2eaa02e9-cf6c-4b19-bfa9-7f1cec4db8bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}