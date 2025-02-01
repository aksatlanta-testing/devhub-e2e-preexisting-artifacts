
{{- define "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.fullname" -}}
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


{{- define "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.labels" -}}
helm.sh/chart: {{ include "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.chart" . }}
{{ include "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo80b4281d-e74d-41ea-b5e1-1a42f0772caa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}