
{{- define "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.fullname" -}}
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


{{- define "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.labels" -}}
helm.sh/chart: {{ include "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.chart" . }}
{{ include "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49725869-ca39-4978-8be4-3b0c7e3a27fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}