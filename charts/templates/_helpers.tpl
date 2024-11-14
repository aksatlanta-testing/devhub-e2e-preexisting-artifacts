
{{- define "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.fullname" -}}
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


{{- define "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.labels" -}}
helm.sh/chart: {{ include "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.chart" . }}
{{ include "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52a7e688-43aa-4ddd-ae5e-59f0c5e02fc3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}