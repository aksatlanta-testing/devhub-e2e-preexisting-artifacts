
{{- define "go-echoabf3721d-0082-4b2f-9947-4251228c894b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabf3721d-0082-4b2f-9947-4251228c894b.fullname" -}}
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


{{- define "go-echoabf3721d-0082-4b2f-9947-4251228c894b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabf3721d-0082-4b2f-9947-4251228c894b.labels" -}}
helm.sh/chart: {{ include "go-echoabf3721d-0082-4b2f-9947-4251228c894b.chart" . }}
{{ include "go-echoabf3721d-0082-4b2f-9947-4251228c894b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabf3721d-0082-4b2f-9947-4251228c894b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabf3721d-0082-4b2f-9947-4251228c894b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}